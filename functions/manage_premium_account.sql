CREATE OR REPLACE FUNCTION check_If_valid_premium_account(user_id INT)
RETURNS BOOLEAN AS
$$
BEGIN
IF (SELECT EXISTS (SELECT 1 FROM premium_accounts
                  WHERE id_listener = user_id
                      AND open_date <= now()
                      AND termination_date > now() LIMIT 1))
    THEN RETURN TRUE;
ELSE RETURN FALSE;
END IF;
END;
$$ LANGUAGE plpgsql;

SELECT (check_If_valid_premium_account(798));