
//For dashboard//
const withImages = require("next-images");
module.exports = withImages({
  domains : ["firebasestorage.googleapis.com"]
});

/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
}

module.exports = nextConfig
