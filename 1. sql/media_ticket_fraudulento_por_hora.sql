SELECT 
    FLOOR(time / 3600) AS hora_do_dia,
    SUM(class) AS total_fraudes,
	ROUND(AVG(amount), 2) AS media_valor_fraude
FROM public.deteccao_fraude
WHERE class = 1 and amount > 0.0
GROUP BY FLOOR(time / 3600)
ORDER BY total_fraudes DESC;