require 'microsoft_kiota_abstractions'
require_relative '../microsoft_graph'
require_relative './models'

module MicrosoftGraph::Models
    class DelegatedAdminAccessDetails
        include MicrosoftKiotaAbstractions::AdditionalDataHolder, MicrosoftKiotaAbstractions::Parsable
        ## 
        # Stores additional data not described in the OpenAPI description found when deserializing. Can be used for serialization as well.
        @additional_data
        ## 
        # The OdataType property
        @odata_type
        ## 
        # The directory roles that the Microsoft partner is assigned in the customer tenant.
        @unified_roles
        ## 
        ## Gets the additionalData property value. Stores additional data not described in the OpenAPI description found when deserializing. Can be used for serialization as well.
        ## @return a i_dictionary
        ## 
        def additional_data
            return @additional_data
        end
        ## 
        ## Sets the additionalData property value. Stores additional data not described in the OpenAPI description found when deserializing. Can be used for serialization as well.
        ## @param value Value to set for the AdditionalData property.
        ## @return a void
        ## 
        def additional_data=(value)
            @additional_data = value
        end
        ## 
        ## Instantiates a new delegatedAdminAccessDetails and sets the default values.
        ## @return a void
        ## 
        def initialize()
            @additional_data = Hash.new
        end
        ## 
        ## Creates a new instance of the appropriate class based on discriminator value
        ## @param parseNode The parse node to use to read the discriminator value and create the object
        ## @return a delegated_admin_access_details
        ## 
        def self.create_from_discriminator_value(parse_node)
            raise StandardError, 'parse_node cannot be null' if parse_node.nil?
            return DelegatedAdminAccessDetails.new
        end
        ## 
        ## The deserialization information for the current model
        ## @return a i_dictionary
        ## 
        def get_field_deserializers()
            return {
                "@odata.type" => lambda {|n| @odata_type = n.get_string_value() },
                "unifiedRoles" => lambda {|n| @unified_roles = n.get_collection_of_object_values(lambda {|pn| MicrosoftGraph::Models::UnifiedRole.create_from_discriminator_value(pn) }) },
            }
        end
        ## 
        ## Gets the @odata.type property value. The OdataType property
        ## @return a string
        ## 
        def odata_type
            return @odata_type
        end
        ## 
        ## Sets the @odata.type property value. The OdataType property
        ## @param value Value to set for the odata_type property.
        ## @return a void
        ## 
        def odata_type=(value)
            @odata_type = value
        end
        ## 
        ## Serializes information the current object
        ## @param writer Serialization writer to use to serialize this model
        ## @return a void
        ## 
        def serialize(writer)
            raise StandardError, 'writer cannot be null' if writer.nil?
            writer.write_string_value("@odata.type", @odata_type)
            writer.write_collection_of_object_values("unifiedRoles", @unified_roles)
            writer.write_additional_data(@additional_data)
        end
        ## 
        ## Gets the unifiedRoles property value. The directory roles that the Microsoft partner is assigned in the customer tenant.
        ## @return a unified_role
        ## 
        def unified_roles
            return @unified_roles
        end
        ## 
        ## Sets the unifiedRoles property value. The directory roles that the Microsoft partner is assigned in the customer tenant.
        ## @param value Value to set for the unified_roles property.
        ## @return a void
        ## 
        def unified_roles=(value)
            @unified_roles = value
        end
    end
end