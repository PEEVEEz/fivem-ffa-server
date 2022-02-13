
module.exports = {
    publicPath: "./",
    outputDir: "./build",
    productionSourceMap: false,
    filenameHashing: false,

    css: {
        extract: false
    },

    chainWebpack: (config) => {
        config.optimization.delete("splitChunks");
    },
}
