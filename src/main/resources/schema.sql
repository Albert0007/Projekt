
CREATE TABLE IF NOT EXISTS country (
   id      INTEGER     NOT NULL  PRIMARY KEY AUTO_INCREMENT  COMMENT 'Уникальный идентификатор',
   name    VARCHAR(50) NOT NULL                              COMMENT 'Название страны',
   version INTEGER     NOT NULL                              COMMENT 'Служебное поле hibernate',
   code    INTEGER     NOT NULL                              COMMENT 'Уникальный код страны'
);




CREATE TABLE IF NOT EXISTS document (
   id      INTEGER     NOT NULL  PRIMARY KEY AUTO_INCREMENT  COMMENT 'Уникальный документ',
   name    VARCHAR(50) NOT NULL                              COMMENT 'Название документа',
   version INTEGER     NOT NULL                              COMMENT 'Служебное поле hibernate',
   code    INTEGER     NOT NULL                              COMMENT 'Уникальный код документа'
);




CREATE TABLE IF NOT EXISTS employee (
   id             INTEGER     NOT NULL  PRIMARY KEY AUTO_INCREMENT  COMMENT 'Уникальный идентификатор',
   first_name     VARCHAR(50) NOT NULL                              COMMENT 'Имя',
   second_name    VARCHAR(50) NOT NULL                              COMMENT 'Фамилия',
   middle_name    VARCHAR(50) NOT NULL                              COMMENT 'Отчество',
   position       VARCHAR(50) NOT NULL                              COMMENT 'Должность',
   phone          INTEGER     NOT NULL                              COMMENT 'Телефон',
   is_identified  BOOLEAN                                           COMMENT 'Работающий или не работающий, если работающий - true',
   country_id     INTEGER     NOT NULL                              COMMENT 'Уникальный идентификатор страны',
   version       INTEGER     NOT NULL                              COMMENT 'Служебное поле hibernate',
   document_id    INTEGER     NOT NULL                              COMMENT 'Уникальный идентификатор документа',
   doc_name      INTEGER     NOT NULL,
   doc_number     INTEGER     NOT NULL,
   doc_data       date        NOT NULL
);

CREATE INDEX IX_employee_ibfk_1 ON employee (document_id);
ALTER TABLE employee ADD FOREIGN KEY (document_id) REFERENCES document(id);

CREATE INDEX IX_employee_ibfk_2 ON employee (country_id);
ALTER TABLE employee ADD FOREIGN KEY (country_id) REFERENCES country(id);

CREATE TABLE IF NOT EXISTS organization (
  id             INTEGER     NOT NULL  PRIMARY KEY AUTO_INCREMENT    COMMENT 'Уникальный идентификатор',
  name           VARCHAR(50) NOT NULL                                COMMENT 'Сокращенное название',
  full_name      VARCHAR(50) NOT NULL                                COMMENT 'Полное название',
  inn            INTEGER     NOT NULL                                COMMENT 'Идентификационный номер налогоплательщика',
  kpp            INTEGER     NOT NULL                                COMMENT 'Код причины постановки на учет в налоговых органах',
  address        VARCHAR(50) NOT NULL                                COMMENT 'Регистрационный адрес',
  phone          INTEGER     NOT NULL                                COMMENT 'Номер телефона',
  is_active      BOOLEAN                                             COMMENT 'Действующая организация, если действует - true',
  version        INTEGER     NOT NULL                                COMMENT 'Служебное поле hibernate'
);




CREATE TABLE IF NOT EXISTS office (
  id             INTEGER       NOT NULL  PRIMARY KEY AUTO_INCREMENT  COMMENT 'Уникальный идентификатор',
  first_name     VARCHAR(50)   NOT NULL                              COMMENT 'Название',
  address        VARCHAR(50)   NOT NULL                              COMMENT 'Регистрационный адрес',
  phone          INTEGER       NOT NULL                              COMMENT 'Номер телефона',
  is_active      BOOLEAN                                             COMMENT 'Действующий офис, если дейcтвует - true',
  version        INTEGER       NOT NULL                              COMMENT 'Служебное поле hibernate',
  org_id         INTEGER       NOT NULL
);

CREATE INDEX IX_office_ibfk_1 ON office (org_id);
ALTER TABLE office ADD FOREIGN KEY (org_id) REFERENCES organization(id);



CREATE TABLE IF NOT EXISTS Employee_Office (
   employee_id    INTEGER     NOT NULL      COMMENT 'Уникальный идентификатор сотрудника',
   office_id      INTEGER     NOT NULL      COMMENT 'Уникальный идентификатор офиса'
);


CREATE INDEX IX_employee_office_ibfk_1 ON Employee_Office (employee_id);
ALTER TABLE Employee_Office ADD FOREIGN KEY (employee_id) REFERENCES employee(id);

CREATE INDEX IX_employee_office_ibfk_2 ON Employee_Office(office_id);
ALTER TABLE Employee_Office ADD FOREIGN KEY (office_id) REFERENCES office(id);




