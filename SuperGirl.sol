pragma solidity ^0.4.0;
contract Votelihe {

    struct Candidate {

        uint votecount;

        string name;

    }

    struct Voter {
      
        bool voted;  // shi'fou是否  tou'guo'piao投过票  
    }

    mapping(address => Voter) public voters;
  //候选人数组
    Candidate[] public candidates;

    function Votelihe() public{

        candidates.push(Candidate({

                name: "范冰冰",

                votecount: 0

            }));

        candidates.push(Candidate({

                name: "迪丽热巴",

                votecount: 0

            }));
            
        candidates.push(Candidate({

            name: "杨幂",

            votecount: 0

        }));

      }

    function Vote_candidate(uint8 numCandidate) public

    {

  //判断投票者是否投过票 已经候选人是否存在
        if(voters[msg.sender].voted ||numCandidate>candidates.length)return;

        candidates[numCandidate].votecount +=1; //给候选人得票+1

        voters[msg.sender].voted=true; //记录投票人状态

    }
    

//获得投票结果
  function Getcount(uint i) constant public returns(uint){
        
        return candidates[i].votecount;
    }

}