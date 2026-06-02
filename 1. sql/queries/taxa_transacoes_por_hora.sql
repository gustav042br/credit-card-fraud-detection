SELECT 
    FLOOR(time / 3600) AS hora_do_dia,
    COUNT(*) AS total_transacoes,
    ROUND(AVG(amount), 2) AS valor_medio_por_hora
FROM public.deteccao_fraude
WHERE class = 0 AND amount > 0.0
GROUP BY FLOOR(time / 3600)
ORDER BY total_transacoes DESC;