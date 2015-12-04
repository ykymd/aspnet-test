FROM microsoft/aspnet

ADD . .
WORKDIR ./src/WebApplication1
RUN dnu restore
EXPOSE 5000
ENTRYPOINT dnx . kestrel
