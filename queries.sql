create database kyc_project;
use kyc_project;
select
	c.customer_id,
    c.name,
    c.declared_income,
    t.amount,
    round(t.amount / c.declared_income, 2) as income_multiple
from customers c
join transactions t on c.customer_id = t.customer_id
where t.amount>c.declared_income*2
order by income_multiple desc;

select
	c.customer_id,
    c.name,
    t.counterparty_country,
    t.amount
from customers c 
join transactions t on c.customer_id = t.customer_id
where counterparty_country in ('Iran', 'North Korea', 'Myanmar', 'Afghanistan', 'Syria');

select customer_id, name, document_status
from customers
where document_status in ('Expired', 'MISSING');

select customer_id, name, pep_flag 
from customers
where pep_flag = 'Yes';

create view customer_risk_flags as 
select c.customer_id, c.name, c.nationality, c.declared_income, c.pep_flag, c.document_status, t.amount, t.counterparty_country, t.transaction_date,
	case 
		when t.amount>c.declared_income*2 then 'Income Mismatch'
        when t.counterparty_country in ('Iran', 'North Korea', 'Myanmar', 'Afghanistan', 'Syria') then 'High-Risk Country' 
        when c.document_status in ('Expired', 'Missing') then 'Document Issue'
        when c.pep_flag = 'Yes' then 'PEP'
        else 'No Flag'
	end as risk_reason
from customers c
join transactions t on c.customer_id = t.customer_id;

select* from customer_risk_flags
where risk_reason != 'No Flag'
order by risk_reason;

select risk_reason, count(*) as total_flagged
from customer_risk_flags
where risk_reason != 'No Flag'
group by risk_reason
order by total_flagged desc;