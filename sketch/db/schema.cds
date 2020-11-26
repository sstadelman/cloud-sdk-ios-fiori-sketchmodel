namespace sap.sstadelman.sketch;

using { managed, cuid } from '@sap/cds/common';

@cds.autoexpose
entity Persons: managed {
    key ID: String;
    firstName: String(63);
    lastName: String(63);
    imgURL: String(255);
    phone: Integer;
    email: String(255);
    video: String(255);
    
}

@cds.autoexpose
entity Customers: Persons {
    status: String(15);
}

@cds.autoexpose
entity Technicians: Persons {
    jobs: Association to many Jobs on jobs.technician = $self;
}

entity Jobs: managed {
    key ID: Integer;
    title: String;
    number: String(15);
    tags: String;
    description: String;
    status: String(15);
    priority: String(7);
    technician: Association to Technicians;
    steps: Association to many JobStep on steps.job = $self;
}

@cds.autoexpose
entity JobStep: cuid {
    title: String;
    isRead: Boolean;
    job: Association to Jobs;
}