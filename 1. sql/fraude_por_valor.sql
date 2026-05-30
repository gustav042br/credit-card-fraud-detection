SELECT 
    CASE 
        WHEN amount <= 10 THEN '1. Micro (Até 10)'
        WHEN amount > 10 AND amount <= 100 THEN '2. Baixo (10 a 100)'
        WHEN amount > 100 AND amount <= 1000 THEN '3. Médio (100 a 1000)'
        ELSE '4. Alto (Acima de 1000)'
    END AS faixa_de_valor,
    
    COUNT(*) AS total_transacoes,
    SUM(class) AS quantidade_fraudes,
    ROUND((SUM(class)::numeric / COUNT(*)) * 100, 3) AS percentual_fraude
    
FROM public.deteccao_fraude

GROUP BY 
    CASE 
        WHEN amount <= 10 THEN '1. Micro (Até 10)'
        WHEN amount > 10 AND amount <= 100 THEN '2. Baixo (10 a 100)'
        WHEN amount > 100 AND amount <= 1000 THEN '3. Médio (100 a 1000)'
        ELSE '4. Alto (Acima de 1000)'
    END