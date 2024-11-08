from os import path, listdir, makedirs
from time import sleep, strftime, localtime
from shutil import copy2


def main():   
    while True:
        try:
            pictures_path = path.join(path.expanduser('~'), 'Pictures')
            if path.exists(path.join(path.expanduser('~'), 'OneDrive', 'Pictures')):
                pictures_path = path.join(path.expanduser('~'), 'OneDrive', 'Pictures')
            screenshots_folder = path.join(pictures_path, 'Screenshots')
            if not path.exists(pictures_path):
                makedirs(pictures_path)
            appdata_local_path = path.join(path.expanduser('~'), 'AppData', 'Local')
            if not path.exists(screenshots_folder):
                makedirs(screenshots_folder)
            while True:
                if path.isdir(path.join(appdata_local_path, 'Packages\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TempState\ScreenClip')):
                    for file in listdir(path.join(appdata_local_path, 'Packages\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TempState\ScreenClip')):
                        file_path = path.join(appdata_local_path, 'Packages\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TempState\ScreenClip', file)
                        if file.endswith('.png'):
                            if not path.isfile(path.join(screenshots_folder, file)):
                                file_mod_time = path.getmtime(file_path)
                                new_file_name = strftime('%Y-%m-%d %H-%M-%S', localtime(file_mod_time)) + '.png'
                                makedirs(path.dirname(path.join(screenshots_folder, new_file_name)), exist_ok=True)
                                copy2(file_path, path.join(screenshots_folder, new_file_name))
                sleep(10)
            
        except Exception as e:
            print(str(e))
            print('Trying again in 10 minutes')
            sleep(600)
        
if __name__ == "__main__":
    main()

