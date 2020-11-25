namespace sap.sstadelman.sketch;

using { managed, cuid } from '@sap/cds/common';

entity Persons: managed, cuid {
    firstName: String(63);
    lastName: String(63);
    imgURL: String(255);
    phone: Integer;
    email: String(255);
    video: String(255);
    
}

entity Customers: Persons {
    status: String(15);
}

entity Technicians: Persons {
    jobs: Association to many Jobs on jobs.technician = $self;
}

entity Jobs: cuid {
    title: String;
    subtitle: String;
    tags: String;
    description: String;
    status: String(15);
    technician: Association to Technicians;
    steps: Association to many JobStep;
}

entity JobStep: cuid {
    title: String;
    isRead: Boolean;
}