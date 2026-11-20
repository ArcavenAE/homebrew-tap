class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.120040.acfe0c4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-120040-acfe0c4/marvel-darwin-arm64"
    sha256 "1a045c862ad3badfe97dbf2d992f680509167b3eaed321597f50e80ea9f322fd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-120040-acfe0c4/marvel-darwin-amd64"
    sha256 "85b96893ea1701b9edc74c373bf8362eecdd4b3f4ccb46f181c1475bc798af3d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-120040-acfe0c4/marvel-linux-arm64"
    sha256 "c7662a3af76a9870ac4e38159af65d4d76264a3db0e0bfd5ea47e026c9f81706"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-120040-acfe0c4/marvel-linux-amd64"
    sha256 "de8352b68154f13819aa6fd0655ea670e2df45b1be2250f994ee441ce35212d0"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
