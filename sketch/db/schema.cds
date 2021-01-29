namespace sap.sstadelman.sketch;

using { managed, cuid } from '@sap/cds/common';

@cds.autoexpose
entity Persons {
    key ID: Integer;
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

entity Jobs {
    key ID: Integer;
    title: String not null;
    number: String(15) not null;
    tags: String;
    description: String;
    status: String(15) not null default 'New';
    priority: String(7) not null;
    technician: Association to Technicians;
    steps: Association to many JobSteps on steps.job = $self;
}

entity JobSteps {
    key ID: Integer;
    title: String not null;
    isRead: Boolean not null default false;
    job: Association to Jobs;
}