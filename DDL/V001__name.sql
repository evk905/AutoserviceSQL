CREATE TABLE carbrand(
id bigint NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name_carbrand CHARACTER VARYING(150) NOT NULL
);

CREATE TABLE carmodel(
id bigint NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name_carmodel CHARACTER VARYING(150) NOT NULL,
carbrand_id INTEGER NOT NULL,
FOREIGN KEY (carbrand_id) REFERENCES carbrand (id) 
);

CREATE TABLE color(
id bigint NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
carbrand_id CHARACTER VARYING(50),
code_color CHARACTER VARYING(150) UNIQUE,
name_color CHARACTER VARYING(150),
FOREIGN KEY (carbrand_id) REFERENCES carbrand(id) 
);

CREATE TABLE car(
id bigint NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
vin CHARACTER (17) NOT NULL UNIQUE,
carband_id INTEGER NOT NULL,
carmodel_id INTEGER NOT NULL,
release_year INTEGER NOT NULL,
transmission CHARACTER VARYING(30) NOT NULL,
body_type CHARACTER VARYING(150) NOT NULL,
mileage INTEGER NOT NULL,
color_id varchar(150) NOT NULL,
country CHARACTER VARYING(150),
price INTEGER NOT NULL,
discription TEXT,
FOREIGN KEY (carmodel_id) REFERENCES carmodel(id) ,
FOREIGN KEY (carband_id) REFERENCES carbrand(id),
FOREIGN KEY (color_id) REFERENCES color(id)
); 