require 'microsoft_kiota_abstractions'
require_relative '../../../../../../../microsoft_graph'
require_relative '../../../../../../../models/o_data_errors/o_data_error'
require_relative '../../../../../../teamwork'
require_relative '../../../../../deleted_teams'
require_relative '../../../../item'
require_relative '../../../channels'
require_relative '../../item'
require_relative '../files_folder'
require_relative './content'

module MicrosoftGraph
    module Teamwork
        module DeletedTeams
            module Item
                module Channels
                    module Item
                        module FilesFolder
                            module Content
                                ## 
                                # Provides operations to manage the media for the teamwork entity.
                                class ContentRequestBuilder
                                    
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
                                    ## Instantiates a new ContentRequestBuilder and sets the default values.
                                    ## @param pathParameters Path parameters for the request
                                    ## @param requestAdapter The request adapter to use to execute the requests.
                                    ## @return a void
                                    ## 
                                    def initialize(path_parameters, request_adapter)
                                        raise StandardError, 'path_parameters cannot be null' if path_parameters.nil?
                                        raise StandardError, 'request_adapter cannot be null' if request_adapter.nil?
                                        @url_template = "{+baseurl}/teamwork/deletedTeams/{deletedTeam%2Did}/channels/{channel%2Did}/filesFolder/content"
                                        @request_adapter = request_adapter
                                        path_parameters = { "request-raw-url" => path_parameters } if path_parameters.is_a? String
                                        @path_parameters = path_parameters if path_parameters.is_a? Hash
                                    end
                                    ## 
                                    ## The content stream, if the item represents a file.
                                    ## @param requestConfiguration Configuration for the request such as headers, query parameters, and middleware options.
                                    ## @return a Fiber of binary
                                    ## 
                                    def get(request_configuration=nil)
                                        request_info = self.to_get_request_information(
                                            request_configuration
                                        )
                                        error_mapping = Hash.new
                                        error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
                                        error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
                                        return @request_adapter.send_async(request_info, Binary, error_mapping)
                                    end
                                    ## 
                                    ## The content stream, if the item represents a file.
                                    ## @param body Binary request body
                                    ## @param requestConfiguration Configuration for the request such as headers, query parameters, and middleware options.
                                    ## @return a Fiber of void
                                    ## 
                                    def put(body, request_configuration=nil)
                                        raise StandardError, 'body cannot be null' if body.nil?
                                        request_info = self.to_put_request_information(
                                            body, request_configuration
                                        )
                                        error_mapping = Hash.new
                                        error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
                                        error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
                                        return @request_adapter.send_async(request_info, nil, error_mapping)
                                    end
                                    ## 
                                    ## The content stream, if the item represents a file.
                                    ## @param requestConfiguration Configuration for the request such as headers, query parameters, and middleware options.
                                    ## @return a request_information
                                    ## 
                                    def to_get_request_information(request_configuration=nil)
                                        request_info = MicrosoftKiotaAbstractions::RequestInformation.new()
                                        request_info.url_template = @url_template
                                        request_info.path_parameters = @path_parameters
                                        request_info.http_method = :GET
                                        unless request_configuration.nil?
                                            request_info.add_headers_from_raw_object(request_configuration.headers)
                                            request_info.add_request_options(request_configuration.options)
                                        end
                                        return request_info
                                    end
                                    ## 
                                    ## The content stream, if the item represents a file.
                                    ## @param body Binary request body
                                    ## @param requestConfiguration Configuration for the request such as headers, query parameters, and middleware options.
                                    ## @return a request_information
                                    ## 
                                    def to_put_request_information(body, request_configuration=nil)
                                        raise StandardError, 'body cannot be null' if body.nil?
                                        request_info = MicrosoftKiotaAbstractions::RequestInformation.new()
                                        request_info.url_template = @url_template
                                        request_info.path_parameters = @path_parameters
                                        request_info.http_method = :PUT
                                        unless request_configuration.nil?
                                            request_info.add_headers_from_raw_object(request_configuration.headers)
                                            request_info.add_request_options(request_configuration.options)
                                        end
                                        request_info.set_content_from_parsable(self.request_adapter, "", body)
                                        return request_info
                                    end

                                    ## 
                                    # Configuration for the request such as headers, query parameters, and middleware options.
                                    class ContentRequestBuilderGetRequestConfiguration
                                        
                                        ## 
                                        # Request headers
                                        attr_accessor :headers
                                        ## 
                                        # Request options
                                        attr_accessor :options
                                    end

                                    ## 
                                    # Configuration for the request such as headers, query parameters, and middleware options.
                                    class ContentRequestBuilderPutRequestConfiguration
                                        
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
