class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.061109.e3a4387"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-061109-e3a4387/marvel-darwin-arm64"
    sha256 "97ae96d2d56413d2926d59dbf8e506cc6b773dd20671b27390331c560280ac90"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-061109-e3a4387/marvel-darwin-amd64"
    sha256 "c212fce7892f6f976ff24949a24b7bac8c76c4e6785d32e994d2377b43714c14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-061109-e3a4387/marvel-linux-arm64"
    sha256 "3c886b895296d28d70d7e7c3ea3758681a7d1955fd25ed5530083868a416d8cf"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-061109-e3a4387/marvel-linux-amd64"
    sha256 "ff5bbf15956555d43aa9f821c970d6f92ae79d5fdf5eae2ed4060b463eba19db"
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
