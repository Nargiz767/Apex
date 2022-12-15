Trigger_Map tm= new Trigger_Map();
String sf =tm.InsertSF_Project();
system.debug(sf );
tm.UpdateSF_Project(sf, 'update trigger');