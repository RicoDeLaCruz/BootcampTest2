Add-Type -AssemblyName PresentationFramework

$Window = New-Object System.Windows.Window
$Window.WindowStartupLocation = "CenterScreen"
$Window.Width = 400
$Window.Height = 300
$Window.Title = "My PowerShell Tool"

# Taskbar Icon
$Window.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon("C:\Users\EnricoDeLC\Downloads\ClassAfternoon-Toolbox-main\script\icon.ico")

# Form header image
$HeaderImage = New-Object System.Windows.Controls.Image
$HeaderImage.Source = [System.Windows.Media.Imaging.BitmapImage]::new([System.Uri] "C:\Users\EnricoDeLC\Downloads\ClassAfternoon-Toolbox-main\script\icon.ico")
$Window.Content = $HeaderImage

# Gif in the form background
$Gif = New-Object System.Windows.Controls.Image
$Gif.Source = [System.Windows.Media.Imaging.BitmapImage]::new([System.Uri] "C:\Users\EnricoDeLC\Downloads\ClassAfternoon-Toolbox-main\script\header.gif")
$Gif.Stretch = "UniformToFill"
$Window.Background = New-Object System.Windows.Media.ImageBrush($Gif.Source)

# Show/Hide function to control screens/dialogues inside the UI
$ShowHideButton = New-Object System.Windows.Controls.Button
$ShowHideButton.Content = "Show/Hide"
$ShowHideButton.Width = 100
$ShowHideButton.Height = 30
$ShowHideButton.HorizontalAlignment = "Left"
$ShowHideButton.VerticalAlignment = "Top"
$ShowHideButton.Margin = "10,10,0,0"
$ShowHideButton.Add_Click({
    $Dialog.Visibility = [System.Windows.Visibility]::Visible
})

$Dialog = New-Object System.Windows.Controls.StackPanel
$Dialog.Visibility = [System.Windows.Visibility]::Hidden

$Window.Content = $HeaderImage
$Window.Content = $Gif
$Window.Content = $ShowHideButton
$Window.Content = $Dialog

$Window.ShowDialog()
