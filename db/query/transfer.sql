-- name: CreateTransfer :one
INSERT INTO transfers (
    from_account_id,
    to_account_id,
    amount
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: GetTransfer :one
SELECT
    id,
    from_account_id,
    to_account_id,
    amount,
    created_at
FROM
    transfers
WHERE
    id = $1 LIMIT 1;

-- name: ListTransfer :many
SELECT
    id,
    from_account_id,
    to_account_id,
    amount,
    created_at
FROM
    transfers
ORDER
    BY id
LIMIT
    $1
OFFSET
    $2;

-- name: UpdateTransfer :one
UPDATE
    transfers
SET
    amount = $2
WHERE
    id = $1 RETURNING *;

-- name: DeleteTransfer :exec
DELETE FROM transfers WHERE id = $1;