ALTER FUNCTION dbo.fn_SplitString_sxzl
(
    @String    NVARCHAR(MAX),
    @Delimiter NCHAR(1)
)
RETURNS TABLE
AS
RETURN
(
    WITH Split_CTE AS
    (
        SELECT
            CAST('<r>' + REPLACE(ISNULL(@String, ''), @Delimiter, '</r><r>') + '</r>' AS XML) AS xmlData
    )
    SELECT
        LTRIM(RTRIM(m.n.value('.','NVARCHAR(500)'))) AS Value
    FROM Split_CTE
    CROSS APPLY xmlData.nodes('/r') m(n)
    WHERE LTRIM(RTRIM(m.n.value('.','NVARCHAR(500)'))) <> ''
)