DELIMITER //

CREATE OR REPLACE PROCEDURE insertarArticuloConImagen(
    IN titulo VARCHAR(255),
    IN contenido TEXT,
    IN id_imagen INT
)
BEGIN
    DECLARE last_post_id INT;

    -- Insertar el artículo completo
    INSERT INTO p1posts (
        post_author, 
        post_date, 
        post_date_gmt, 
        post_content, 
        post_title, 
        post_status, 
        comment_status, 
        ping_status, 
        post_name, 
        post_type
    ) VALUES (
        1, 
        NOW(), 
        NOW(), 
        contenido, 
        titulo, 
        'publish', 
        'open', 
        'open', 
        REPLACE(LOWER(titulo), ' ', '-'), 
        'post'
    );

    SET last_post_id = LAST_INSERT_ID();

    -- Asociar la imagen destacada
    INSERT INTO p1postmeta (post_id, meta_key, meta_value)
    VALUES (last_post_id, '_thumbnail_id', id_imagen);
END //

DELIMITER ;
