require 'microsoft_kiota_abstractions'
require_relative '../../microsoft_graph'
require_relative '../../models/archived_print_job'
require_relative '../../models/base_collection_pagination_count_response'
require_relative '../reports'
require_relative './i48029ae9e4f6546df5a0a07d799572cb29b62489480fe357fc0754eb0b398d2b'

module MicrosoftGraph
    module Reports
        module I48029ae9e4f6546df5a0a07d799572cb29b62489480fe357fc0754eb0b398d2b
            class GetGroupArchivedPrintJobsWithGroupIdWithStartDateTimeWithEndDateTimeResponse < MicrosoftGraph::Models::BaseCollectionPaginationCountResponse
                include MicrosoftKiotaAbstractions::Parsable
                ## 
                # The value property
                @value
                ## 
                ## Instantiates a new getGroupArchivedPrintJobsWithGroupIdWithStartDateTimeWithEndDateTimeResponse and sets the default values.
                ## @return a void
                ## 
                def initialize()
                    super
                end
                ## 
                ## Creates a new instance of the appropriate class based on discriminator value
                ## @param parseNode The parse node to use to read the discriminator value and create the object
                ## @return a get_group_archived_print_jobs_with_group_id_with_start_date_time_with_end_date_time_response
                ## 
                def self.create_from_discriminator_value(parse_node)
                    raise StandardError, 'parse_node cannot be null' if parse_node.nil?
                    return GetGroupArchivedPrintJobsWithGroupIdWithStartDateTimeWithEndDateTimeResponse.new
                end
                ## 
                ## The deserialization information for the current model
                ## @return a i_dictionary
                ## 
                def get_field_deserializers()
                    return super.merge({
                        "value" => lambda {|n| @value = n.get_collection_of_object_values(lambda {|pn| MicrosoftGraph::Models::ArchivedPrintJob.create_from_discriminator_value(pn) }) },
                    })
                end
                ## 
                ## Serializes information the current object
                ## @param writer Serialization writer to use to serialize this model
                ## @return a void
                ## 
                def serialize(writer)
                    raise StandardError, 'writer cannot be null' if writer.nil?
                    super
                    writer.write_collection_of_object_values("value", @value)
                end
                ## 
                ## Gets the value property value. The value property
                ## @return a archived_print_job
                ## 
                def value
                    return @value
                end
                ## 
                ## Sets the value property value. The value property
                ## @param value Value to set for the value property.
                ## @return a void
                ## 
                def value=(value)
                    @value = value
                end
            end
        end
    end
end
