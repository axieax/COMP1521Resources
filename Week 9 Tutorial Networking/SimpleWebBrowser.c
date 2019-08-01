/*
The next Google Chrome. The Best Web Browser In The History Of The World.
You can use this with the simple web server lab. For the ultimate combo. (You might have to change the port number)
Ryan Fallah
 */

#include <sys/types.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char **argv)
{
    if (argc < 2)
    {
        fprintf(stderr, "Usage: The first argument should be the path you want to send the request to, e.g. /hello \n");
        exit(1);
    }

    /* Create a new TCP/IP Socket. */
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0)
    {
        printf("Failed to create socket!\n");
        return EXIT_FAILURE;
    }

    /* Grab the server's IP address and other details */
    struct hostent *server = gethostbyname("localhost");
    if (server == NULL)
    {
        printf("Failed to get the host IP details!\n");
        return EXIT_FAILURE;
    }

    /* Create a struct for the servers details. */
    struct sockaddr_in in = {
        .sin_family = AF_INET,
        .sin_port = htons(15000), // Port
        .sin_addr = {}};

    /* Copy the IP address of localhost from the struct hostent into the sockaddr_in */
    bcopy(
        (char *)server->h_addr,
        (char *)&in.sin_addr.s_addr,
        server->h_length);

    /* Connect to the server, taking note that we pass in our sockaddr_in as a generic sockaddr pointer. */
    int err = connect(sockfd, (struct sockaddr *)&in, sizeof(in));
    if (err < 0)
    {
        printf("Connection failed to server!\n");
        return EXIT_FAILURE;
    }

    /* Construct a HTTP request message */
    char buffer[BUFSIZ];
    snprintf(buffer, BUFSIZ,
             "GET %s HTTP/1.1\r\n"
             "Host: 127.0.0.1\r\n"
             "\r\n",
             argv[1]);

    /* Send the request to the server by writing to the socket */
    err = write(sockfd, buffer, strlen(buffer));
    if (err < 0)
    {
        printf("Failed to send request to server!\n");
    }

    /* Read response back from server */
    int n;
    while ((n = read(sockfd, buffer, BUFSIZ)) > 0)
    {
        write(1, buffer, n); // Write response to STDOUT.
    }

    /* close the socket like any normal file descriptor. */
    close(sockfd);

    return EXIT_SUCCESS;
}