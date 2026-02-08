from locust import HttpUser, task


class HealthCheckUser(HttpUser):
    @task
    def check_health(self):
        self.client.get("/health")
