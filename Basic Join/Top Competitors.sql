SELECT H.hacker_id, 
       H.name 
FROM   submissions S 
       JOIN challenges C 
         ON S.challenge_id = C.challenge_id 
       JOIN difficulty D 
         ON C.difficulty_level = D.difficulty_level 
       JOIN hackers H 
         ON S.hacker_id = H.hacker_id 
Where S.score = D.score 
GROUP  BY H.hacker_id, 
          H.name 
HAVING Count(Distinct S.challenge_id) > 1 
ORDER  BY COUNT(DISTINCT S.challenge_id)  DESC, 
          h.hacker_id ASC; 
