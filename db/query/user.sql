-- name: CreateUser :one
INSERT INTO users (
    username,
    hashed_password,
    full_name,
    email
) VALUES (
    $1, $2, $3, $4
) RETURNING *;

-- name: GetUser :one
SELECT
    *
FROM
     users
WHERE
    username = $1 LIMIT 1;

-- -- name: GetAccountForUpdate :one
-- SELECT
--     id,
--     owner,
--     balance,
--     currency,
--     created_at
-- FROM
--     accounts
-- WHERE
--     id = $1 LIMIT 1
-- FOR NO KEY UPDATE;
--
-- -- name: ListAccount :many
-- SELECT
--     id,
--     owner,
--     balance,
--     currency,
--     created_at
-- FROM
--      accounts
-- ORDER
--     BY id
-- LIMIT
--     $1
-- OFFSET
--     $2;
--
-- -- name: UpdateAccount :one
-- UPDATE
--     accounts
-- SET
--     balance = $2
-- WHERE
--     id = $1 RETURNING *;
--
-- -- name: UpdateAccountBalance :one
-- UPDATE
--     accounts
-- SET
--     balance = balance + sqlc.arg(amount)
-- WHERE
--     id = sqlc.arg(id) RETURNING *;
--
-- -- name: DeleteAccount :exec
-- DELETE FROM accounts WHERE id = $1;