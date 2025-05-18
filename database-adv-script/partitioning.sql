CREATE TABLE booking_partitioned (
    booking_id UUID,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price >= 0),
    status VARCHAR NOT NULL CHECK (status IN ('pending', 'confirmed', 'cancelled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (end_date > start_date),
    CONSTRAINT booking_user_fk FOREIGN KEY (user_id) REFERENCES "User" (user_id) ON DELETE CASCADE,
    CONSTRAINT booking_property_fk FOREIGN KEY (property_id) REFERENCES property (property_id) ON DELETE CASCADE,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);


CREATE TABLE booking_2024_01 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

ALTER TABLE booking_2024_01
    ADD CHECK (end_date > start_date);


CREATE TABLE booking_2024_02 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

ALTER TABLE booking_2024_02
    ADD CHECK (end_date > start_date);


CREATE TABLE booking_2024_03 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2024-03-01') TO ('2024-04-01');

ALTER TABLE booking_2024_03
    ADD CHECK (end_date > start_date);

CREATE INDEX idx_booking_2024_01_user_id ON booking_2024_01 (user_id);
CREATE INDEX idx_booking_2024_01_property_id ON booking_2024_01 (property_id);
CREATE INDEX idx_booking_2024_01_start_date ON booking_2024_01 (start_date);

CREATE INDEX idx_booking_2024_02_user_id ON booking_2024_02 (user_id);
CREATE INDEX idx_booking_2024_02_property_id ON booking_2024_02 (property_id);
CREATE INDEX idx_booking_2024_02_start_date ON booking_2024_02 (start_date);

CREATE INDEX idx_booking_2024_03_user_id ON booking_2024_03 (user_id);
CREATE INDEX idx_booking_2024_03_property_id ON booking_2024_03 (property_id);
CREATE INDEX idx_booking_2024_03_start_date ON booking_2024_03 (start_date);