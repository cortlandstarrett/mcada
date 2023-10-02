-- class package:  ${self.name}
-- description:  self.description

.if ( "" != domain_types_package_name )
with ${domain_types_package_name};
.end if

package ${root_package.name}.${domain_package.name}.${self.name} is

--**************  Object ${self.long_name} Information **************

Object_String : String := "${self.name}";

${record_body}

.if ( self.is_active )

   type Object_State_Type is (
      State_0,
      Non_Existent,
      appstate1,
      appstate2,
      appstate3);

   Object_State_Type_First : constant Object_State_Type := Object_State_Type'first;

   type ${domain_package.name}_${self.name}_Type is new ${domain_package.name}_Type with record
     -- TODO define fields here.

      -- Non initialised identifying non referential
      ReferenceTS : Application_Types.Base_Integer_Type;

      Current_State :  Object_State_Type :=  Object_State_Type_First;

   end record;

     Attribute_Count : constant Application_Types.Base_Integer_Type := -2;


   function Get_Current_State (
      This_Object: Root_Object.Object_Access )
   return Object_State_Type;

   procedure Put_Current_State (
      This_Object : in Root_Object.Object_Access;
      Current_State_Value : in  Object_State_Type );

.end if
end ${root_package.name}.${domain_package.name}.${self.name};
