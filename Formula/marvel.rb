class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261124.161645.738774f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-161645-738774f/marvel-darwin-arm64"
    sha256 "20a7793f5177d8d0d1d1dcb86a1ce4bdf0f8331a32503683fb9955dc86580df4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-161645-738774f/marvel-darwin-amd64"
    sha256 "90837db72be18da8ea384da90953267b4ac89bda958ff7dae4f504244842ea2f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-161645-738774f/marvel-linux-arm64"
    sha256 "0a4eb9d2fbac202ebf53248e6e3472f23b37473fbb88e45e4065d22e24adb431"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-161645-738774f/marvel-linux-amd64"
    sha256 "c6bb0702d583f35ceb0c9b1ec198b35a505939f2ed78ea4290789b6b1134b00a"
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
