import os, datetime
from azure.storage.blob import BlobServiceClient, BlobClient, ContainerClient, __version__

try:
    AZURE_STORAGE_CONNECTION_STRING = \
        "DefaultEndpointsProtocol=https;AccountName=fasteamaston;" \
        "AccountKey=RaD8o6ak7ccXT2RgcgkibJZ/knyzXHN9Z8t+Na2wfIhdWBMJGvEASDnN/uLKhJP3NrRP3737IDFCKrMcKWHzNA==;" \
        "EndpointSuffix=core.windows.net"
    local_file_name_log = "app.log"
    #upload_file_path = os.path.join(local_path_log, local_file_name_log)

    #connect_str = os.getenv('AZURE_STORAGE_CONNECTION_STRING')
    connect_str = AZURE_STORAGE_CONNECTION_STRING

    datetime_today = datetime.datetime.today().strftime('%Y%m%d%H%M%S')

    # Create the BlobServiceClient object which will be used to create a container client
    blob_service_client = BlobServiceClient.from_connection_string(connect_str)

    # Create a unique name for the container
    container_name = "logstash" + datetime_today

    # Create the container
    container_client = blob_service_client.create_container(container_name)

    # Create a unique name for the blob
    blob_name = "blob" + datetime_today + ".log"

    # Create a blob client
    blob_client = blob_service_client.get_blob_client(container=container_name, blob=blob_name)

    # Upload the log file
    with open(local_file_name_log, "rb") as data:
        blob_client.upload_blob(data)

except Exception as ex:
    print('Exception:')
    print(ex)
