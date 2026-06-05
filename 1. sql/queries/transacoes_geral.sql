SELECT FLOOR(time/3600) AS horas_do_dia, amount AS transacoes, class AS classificador
FROM public.deteccao_fraude
WHERE amount > 0.00
GROUP BY FLOOR(time/3600), amount, class
ORDER BY horas_do_dia ASC;