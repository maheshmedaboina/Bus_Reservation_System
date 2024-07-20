CREATE DATABASE BusReservationSystem;

USE BusReservationSystem;

CREATE TABLE Ticket (
    ticket_id INT PRIMARY KEY,
    ticket_number VARCHAR(50) NOT NULL,
    ticket_date DATE NOT NULL,
    ticket_amount DECIMAL(10, 2) NOT NULL,
    ticket_type VARCHAR(50) NOT NULL
);

CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(100) NOT NULL,
    passenger_site_number VARCHAR(50) NOT NULL,
    passenger_phone VARCHAR(15) NOT NULL,
    passenger_age INT
);

CREATE TABLE Conductor (
    conductor_id INT PRIMARY KEY,
    conductor_name VARCHAR(100) NOT NULL,
    conductor_address VARCHAR(255) NOT NULL,
    conductor_age INT,
    conductor_phone VARCHAR(15) NOT NULL
);

CREATE TABLE Bus (
    bus_number INT PRIMARY KEY,
    bus_windows INT NOT NULL,
    bus_route VARCHAR(100) NOT NULL,
    bus_time TIME NOT NULL,
    bus_sites INT NOT NULL
);

CREATE TABLE Route (
    route_id INT PRIMARY KEY,
    route_name VARCHAR(100) NOT NULL,
    start_point VARCHAR(100) NOT NULL,
    end_point VARCHAR(100) NOT NULL,
    total_distance DECIMAL(10, 2) NOT NULL,
    estimated_time TIME NOT NULL
);

-- Relationships

CREATE TABLE Buy (
    passenger_id INT,
    ticket_id INT,
    PRIMARY KEY (passenger_id, ticket_id),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id)
);

CREATE TABLE Check (
    conductor_id INT,
    ticket_id INT,
    PRIMARY KEY (conductor_id, ticket_id),
    FOREIGN KEY (conductor_id) REFERENCES Conductor(conductor_id),
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id)
);

CREATE TABLE Have (
    conductor_id INT,
    bus_number INT,
    PRIMARY KEY (conductor_id, bus_number),
    FOREIGN KEY (conductor_id) REFERENCES Conductor(conductor_id),
    FOREIGN KEY (bus_number) REFERENCES Bus(bus_number)
);

CREATE TABLE Travel (
    passenger_id INT,
    bus_number INT,
    PRIMARY KEY (passenger_id, bus_number),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
    FOREIGN KEY (bus_number) REFERENCES Bus(bus_number)
);

CREATE TABLE Assigned (
    bus_number INT,
    route_id INT,
    PRIMARY KEY (bus_number, route_id),
    FOREIGN KEY (bus_number) REFERENCES Bus(bus_number),
    FOREIGN KEY (route_id) REFERENCES Route(route_id)
);
