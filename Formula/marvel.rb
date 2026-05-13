class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260513.202143.7879bd4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-202143-7879bd4/marvel-darwin-arm64"
    sha256 "4e9f136fe5be7ed428aa12d0da315c373caf7633770163b67f2344cfc2208702"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-202143-7879bd4/marvel-darwin-amd64"
    sha256 "17a726cb953126eba68faf3e1d7af20360840159a0e0032d52da6283a9d30a1b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-202143-7879bd4/marvel-linux-arm64"
    sha256 "b4adc68fe1e8b1d0e4b8f429d6bd98199dc96ae4188a00e85e13cff54876bf0f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-202143-7879bd4/marvel-linux-amd64"
    sha256 "315c9380734659bfe362d0eedb243a2c37d201677209f8d6cef7707364d606f4"
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
