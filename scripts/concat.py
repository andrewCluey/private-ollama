import os

def read_files_as_prompt(directory, max_file_size=50000):
    """
    Reads all code files in the given directory (recursively) and concatenates
    them into a single prompt with file separators.
    
    Args:
        directory (str): Path to the folder containing code files.
        max_file_size (int): Max file size in bytes to read (skip bigger files).
    
    Returns:
        str: Combined prompt with filenames and contents.
    """
    prompt_parts = []
    
    for root, _, files in os.walk(directory):
        for filename in files:
            filepath = os.path.join(root, filename)
            # Skip large files to avoid huge prompts
            if os.path.getsize(filepath) > max_file_size:
                print(f"Skipping large file: {filepath}")
                continue
            
            try:
                with open(filepath, "r", encoding="utf-8") as f:
                    content = f.read()
                    # Clean or trim content if needed here
                    prompt_parts.append(f"File: {os.path.relpath(filepath, directory)}\n{'-'*32}\n{content}\n")
            except Exception as e:
                print(f"Failed to read {filepath}: {e}")
    
    return "\n".join(prompt_parts)

if __name__ == "__main__":
    code_folder = "./my_code"  # Change this to your code folder path
    prompt_text = read_files_as_prompt(code_folder)
    
    # Add instructions at the end
    prompt_text += "\nPlease provide a summary of the code and its main functionalities."
    
    print(prompt_text[:2000])  # Print first 2000 chars to check prompt length
    
    # Now you can send `prompt_text` as the "prompt" in your API call JSON payload
