import axios from 'axios'

const apiRequest = axios.create({
    baseURL: process.env.VUE_APP_BACKEND_URL
})

//HealthCheck

let healthCheck = {
    healthcheck: () => {
        return apiRequest.get('/healthcheck');
    },
}

export default healthCheck
