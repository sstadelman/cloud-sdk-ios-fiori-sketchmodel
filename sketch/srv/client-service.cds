using { sap.sstadelman.sketch as my } from '../db/schema';

service Client @(_requires:'authenticated-user') {
  entity Jobs as projection on my.Jobs;
  entity JobSteps as projection on my.JobSteps;
}