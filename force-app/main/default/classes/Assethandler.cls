public class Assethandler {
    public static void Assethandlerupdate(List<asset> assTriggerNew, List<asset> assTriggerOld,
        Map<id, asset> assTriggerNewMap, Map<id, asset> assTriggerOldMap) {
           for (asset eachass:assTriggerNew){
            boolean ship = false;
            boolean install = false;
                 if (Trigger.isInsert && eachass.status == 'shipped') {
                  ship = true;
                }
                if (Trigger.isInsert && eachass.status == 'installed') {
                    install = true;
                  }

                  if (Trigger.isUpdate) {
                    Asset assOld = assTriggerOldMap.get(eachass.Id);
                    Asset assNew = assTriggerNewMap.get(eachass.Id);
                    if (eachass.status == 'shipped' &&
                    assOld.status!= assNew.Status ) {
                     ship = true;
                 }
                 if (eachass.status == 'installed' &&
                 assOld.status!= assNew.Status ) {
                  install = true;
    }
}
              if (ship ) {
           eachass.Description = 'Asset in shipped';
}
             if (install) {
           eachass.Description = 'Asset in installed';
}
}
        }

    }