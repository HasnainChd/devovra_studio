{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    try {
      const appRunner = await engineInitializer.initializeEngine();
      
      // Remove the custom CSS loader from the DOM
      const loader = document.getElementById('loading-indicator');
      if (loader) {
        loader.remove();
      }
      
      await appRunner.runApp();
    } catch (error) {
      console.error("Flutter engine failed to initialize:", error);
      const loaderText = document.querySelector('.loader-text');
      if (loaderText) {
        loaderText.style.animation = "none";
        loaderText.innerHTML = "Initialization Failed<br><span style='font-size: 12px; font-weight: normal; color: #EF4444; display: block; margin-top: 8px;'>Please check your internet connection or run with the HTML renderer.</span>";
      }
      const doubleBounce1 = document.querySelector('.double-bounce1');
      const doubleBounce2 = document.querySelector('.double-bounce2');
      if (doubleBounce1) doubleBounce1.style.backgroundColor = "#EF4444";
      if (doubleBounce2) doubleBounce2.style.backgroundColor = "#F87171";
    }
  }
});
