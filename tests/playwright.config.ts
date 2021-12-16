import { PlaywrightTestConfig } from '@playwright/test';
const config: PlaywrightTestConfig = {
//    testDir: './tests',
    /* Maximum time one test can run for. */
    timeout: 30 * 1000,
    globalTimeout: 60 * 60 * 1000,
    snapshotDir: './snapshots',
    reporter: 'html', //process.env.CI ? 'github' : 'list',
    use: {
        headless: true,
        baseURL: process.env.AZHOP_FQDN,
        viewport: { width: 1600, height: 900 },
        screenshot: 'only-on-failure',
        httpCredentials: {
            username: process.env.AZHOP_USER,
            password: process.env.AZHOP_PASSWORD
        },
    },
};
export default config;