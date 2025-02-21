// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    struct Campaign {
        address payable owner;
        uint goal;
        uint deadline;
        uint fundsRaised;
        bool isWithdrawn;
    }

    mapping(uint => Campaign) public campaigns;
    mapping(uint => mapping(address => uint)) public contributions;
    uint public campaignCount;

    event CampaignCreated(uint campaignId, address owner, uint goal, uint deadline);
    event ContributionReceived(uint campaignId, address contributor, uint amount);
    event FundsWithdrawn(uint campaignId, uint amount);

    function createCampaign(uint _goal, uint _durationInDays) external {
        require(_goal > 0, "Goal must be greater than zero");
        uint deadline = block.timestamp + (_durationInDays * 1 days);
        campaigns[campaignCount] = Campaign(payable(msg.sender), _goal, deadline, 0, false);
        emit CampaignCreated(campaignCount, msg.sender, _goal, deadline);
        campaignCount++;
    }

    function contribute(uint _campaignId) external payable {
        Campaign storage campaign = campaigns[_campaignId];
        require(block.timestamp < campaign.deadline, "Campaign has ended");
        require(msg.value > 0, "Contribution must be greater than zero");
        
        campaign.fundsRaised += msg.value;
        contributions[_campaignId][msg.sender] += msg.value;
        emit ContributionReceived(_campaignId, msg.sender, msg.value);
    }

    function withdrawFunds(uint _campaignId) external {
        Campaign storage campaign = campaigns[_campaignId];
        require(msg.sender == campaign.owner, "Only the owner can withdraw");
        require(block.timestamp >= campaign.deadline, "Campaign is still active");
        require(campaign.fundsRaised >= campaign.goal, "Funding goal not reached");
        require(!campaign.isWithdrawn, "Funds already withdrawn");
        
        campaign.isWithdrawn = true;
        uint amount = campaign.fundsRaised;
        campaign.fundsRaised = 0;
        campaign.owner.transfer(amount);
        emit FundsWithdrawn(_campaignId, amount);
    }
    
    function refund(uint _campaignId) external {
        Campaign storage campaign = campaigns[_campaignId];
        require(block.timestamp >= campaign.deadline, "Campaign is still active");
        require(campaign.fundsRaised < campaign.goal, "Campaign met its goal");
        
        uint contributedAmount = contributions[_campaignId][msg.sender];
        require(contributedAmount > 0, "No contributions to refund");
        
        contributions[_campaignId][msg.sender] = 0;
        payable(msg.sender).transfer(contributedAmount);
    }
}
