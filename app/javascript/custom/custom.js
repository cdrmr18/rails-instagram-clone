import * as FilePond from "filepond";
// Get a reference to the file input element
const inputElement = document.getElementById("post_photos");
import FilePondPluginImagePreview from "filepond-plugin-image-preview";
// Register the plugin
FilePond.registerPlugin(FilePondPluginImagePreview);

// Create a FilePond instance
const pond = FilePond.create(inputElement, {
  credits: {},
  storeAsFile: true,
  allowMultiple: true,
  allowReorder: true,
});

