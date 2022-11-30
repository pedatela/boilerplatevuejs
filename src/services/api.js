import axios from 'axios'
import config from '../config.json'

const apiRequest = axios.create({
    baseURL: `${config.VUE_APP_BACKEND_URL}`
})

//HealthCheck

let healthCheck = {
    healthcheck: () => {
        return apiRequest.get('/healthcheck');
    },
}

export default healthCheck
