SELECT 
    FLOOR(time / 3600) AS hora_do_dia,
    COUNT(*) AS total_transacoes,
    SUM(class) AS total_fraudes
FROM public.deteccao_fraude
GROUP BY FLOOR(time / 3600)
ORDER BY total_fraudes DESC;
-- ORDER BY hora_do_dia;