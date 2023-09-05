
create database finance;

use finance;

select * from finance_1;
select * from finance_2;


----- Year wise loan amount Stats----
select year_added ,sum(loan_amnt) from finance_1 group by year_added order by year_added ;	


----- Grade and sub grade wise revol_bal----
select f1.grade,f1.sub_grade,sum(f2.revol_bal) from finance_1 as f1
                             join finance_2 as f2 
                             on f2.id=f1.id group by f1.grade,f1.sub_grade order by f1.grade;
        
        
----- Total Payment for Verified Status Vs Total Payment for Non Verified Status----
select verification_status,round(sum(total_pymnt),2) from finance_1 as f1  
                                    join finance_2 as f2  
                                    on f2.id=f1.id where verification_status in ('verified','not verified')  group by verification_status ;


----- State wise and last_credit_pull_d wise loan status----
select addr_state,last_credit_pull_d,loan_status from finance_1 as f1 
                                join finance_2 as f2  
                                on f2.id=f1.id group by f1.addr_state,f2.last_credit_pull_d,f1.loan_status order by f1.addr_state;
 
 
 ----- Home ownership Vs last payment date stats----
 select f1.home_ownership,f2.last_pymnt_d from finance_1 as f1 join finance_2 as f2 on f2.id=f1.id ;