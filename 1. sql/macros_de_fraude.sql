SELECT 
    COUNT(*) AS total_fraude,
	SUM(amount) AS prejuizo_total,
	MAX(amount) AS maior_transacao_fraudulenta,
    ROUND(AVG(amount), 2) AS valor_fraude_media_total
FROM public.deteccao_fraude
WHERE class = 1 AND amount > 0.0;
