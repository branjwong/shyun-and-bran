DROP TABLE IF EXISTS Localization;
CREATE TABLE Localization (
    page_name TEXT,
    field_name TEXT,
    english TEXT NOT NULL,
    PRIMARY KEY (page_name, field_name)
);

INSERT INTO Localization VALUES ('general', 'app_name', 'ShowMeAround');
