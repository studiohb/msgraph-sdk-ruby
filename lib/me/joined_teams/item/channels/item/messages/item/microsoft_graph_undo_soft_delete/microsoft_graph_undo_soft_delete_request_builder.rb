require 'microsoft_kiota_abstractions'
require_relative '../../../../../../../../microsoft_graph'
require_relative '../../../../../../../../models/o_data_errors/o_data_error'
require_relative '../../../../../../../me'
require_relative '../../../../../../joined_teams'
require_relative '../../../../../item'
require_relative '../../../../channels'
require_relative '../../../item'
require_relative '../../messages'
require_relative '../item'
require_relative './microsoft_graph_undo_soft_delete'

module MicrosoftGraph
    module Me
        module JoinedTeams
            module Item
                module Channels
                    module Item
                        module Messages
                            module Item
                                module MicrosoftGraphUndoSoftDelete
                                    ## 
                                    # Provides operations to call the undoSoftDelete method.
                                    class MicrosoftGraphUndoSoftDeleteRequestBuilder
                                        
                                        ## 
                                        # Path parameters for the request
                                        @path_parameters
                                        ## 
                                        # The request adapter to use to execute the requests.
                                        @request_adapter
                                        ## 
                                        # Url template to use to build the URL for the current request builder
                                        @url_template
                                        ## 
                                        ## Instantiates a new MicrosoftGraphUndoSoftDeleteRequestBuilder and sets the default values.
                                        ## @param pathParameters Path parameters for the request
                                        ## @param requestAdapter The request adapter to use to execute the requests.
                                        ## @return a void
                                        ## 
                                        def initialize(path_parameters, request_adapter)
                                            raise StandardError, 'path_parameters cannot be null' if path_parameters.nil?
                                            raise StandardError, 'request_adapter cannot be null' if request_adapter.nil?
                                            @url_template = "{+baseurl}/me/joinedTeams/{team%2Did}/channels/{channel%2Did}/messages/{chatMessage%2Did}/microsoft.graph.undoSoftDelete"
                                            @request_adapter = request_adapter
                                            path_parameters = { "request-raw-url" => path_parameters } if path_parameters.is_a? String
                                            @path_parameters = path_parameters if path_parameters.is_a? Hash
                                        end
                                        ## 
                                        ## Invoke action undoSoftDelete
                                        ## @param requestConfiguration Configuration for the request such as headers, query parameters, and middleware options.
                                        ## @return a Fiber of void
                                        ## 
                                        def post(request_configuration=nil)
                                            request_info = self.to_post_request_information(
                                                request_configuration
                                            )
                                            error_mapping = Hash.new
                                            error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
                                            error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
                                            return @request_adapter.send_async(request_info, nil, error_mapping)
                                        end
                                        ## 
                                        ## Invoke action undoSoftDelete
                                        ## @param requestConfiguration Configuration for the request such as headers, query parameters, and middleware options.
                                        ## @return a request_information
                                        ## 
                                        def to_post_request_information(request_configuration=nil)
                                            request_info = MicrosoftKiotaAbstractions::RequestInformation.new()
                                            request_info.url_template = @url_template
                                            request_info.path_parameters = @path_parameters
                                            request_info.http_method = :POST
                                            unless request_configuration.nil?
                                                request_info.add_headers_from_raw_object(request_configuration.headers)
                                                request_info.add_request_options(request_configuration.options)
                                            end
                                            return request_info
                                        end

                                        ## 
                                        # Configuration for the request such as headers, query parameters, and middleware options.
                                        class MicrosoftGraphUndoSoftDeleteRequestBuilderPostRequestConfiguration
                                            
                                            ## 
                                            # Request headers
                                            attr_accessor :headers
                                            ## 
                                            # Request options
                                            attr_accessor :options
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
