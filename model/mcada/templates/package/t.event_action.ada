separate (${root_package.name}.${domain_package.name}.${class_package.name})
procedure Event_Action (
   Dispatch_Event : in     ${domain_package.name}_${class_package.name}_Instance_Event_Type;
   This_Event     : in out ${root_package.name}.Root_Event_Access_Type) is

   This_Action : Event_Class;
   This        : ${root_package.name}.Object_Access;
begin

   This_Action := ${domain_package.name}_${class_package.name}_Instance_Event_Type(This_Event.all).This_Event_Class;
   This := ${domain_package.name}_${class_package.name}_Instance_Event_Type(This_Event.all).Target_Instance;


   -- Ensure that the source instance still exists. 
   if This /= null then
      This_Event_Dispatch_Matrix (This_Action,${domain_package.name}_${class_package.name}_Type(This.all).Current_State) (This, This_Event);
      --
   end if;
  
   ${root_package.name}.Free (This_Event);

end Event_Action;
