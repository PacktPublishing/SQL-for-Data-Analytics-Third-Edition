-- Step 2
SELECT pg_sleep(1000);

-- Step 3
SELECT pid, query FROM pg_stat_activity WHERE state = 'active';

-- Step 4
SELECT pg_cancel_backend(<YOUR_PID>);

