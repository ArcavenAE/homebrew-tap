class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.232521.6beb0f2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-232521-6beb0f2/marvel-darwin-arm64"
    sha256 "631a8315a0ce4c340e467142e0482dee29aa97088610b37e1fd1846e61dea92a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-232521-6beb0f2/marvel-darwin-amd64"
    sha256 "8b468adad1d4c2a977cd78e3cdf5a415fe8ef28c2cca50714ce86026eb047cd3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-232521-6beb0f2/marvel-linux-arm64"
    sha256 "ade535a20cf84e28559572402827823c31b1630d2aa6e11b0f5754a7b031344a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-232521-6beb0f2/marvel-linux-amd64"
    sha256 "4b2c913d8078f2f117ad72a4bdc1924bc06d6a23ce7b09057082c042301f3575"
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
