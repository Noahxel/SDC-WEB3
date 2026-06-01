// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SkillBadge {

    struct Badge {
        address student;
        string  skill;
        uint256 issuedAt;
        address issuer;
    }

    Badge[] public badges;
    mapping(address => uint256[]) public badgesByStudent;

    event BadgeIssued(
        address indexed student,
        string skill,
        uint256 issuedAt,
        address indexed issuer
    );

    function issueBadge(address student, string calldata skill) external {
        uint256 index = badges.length;
        badges.push(Badge(student, skill, block.timestamp, msg.sender));
        badgesByStudent[student].push(index);
        emit BadgeIssued(student, skill, block.timestamp, msg.sender);
    }

    function getBadgeCount() external view returns (uint256) {
        return badges.length;
    }

    function getBadgesOf(address student)
        external view returns (uint256[] memory)
    {
        return badgesByStudent[student];
    }

    function getBadge(uint256 index)
        external view
        returns (address, string memory, uint256, address)
    {
        Badge memory b = badges[index];
        return (b.student, b.skill, b.issuedAt, b.issuer);
    }
}
