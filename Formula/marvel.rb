class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260917.231742.9896e61"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-231742-9896e61/marvel-darwin-arm64"
    sha256 "1f363688bd645c921e052e7088fc0e24aadae78dead0befa2e1342b8d756fd71"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-231742-9896e61/marvel-darwin-amd64"
    sha256 "b10ba39148e29a64a1f1a94b7c99c15fe1b1bd34fb67eca80d3fad891a528ead"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-231742-9896e61/marvel-linux-arm64"
    sha256 "dfdfcdd78537719f48aa52943affc9602ab4411471f968d8adf85c3fda4b0653"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-231742-9896e61/marvel-linux-amd64"
    sha256 "a6315de406477a4b92d776d094d7fae11c38317bade092b861ab375a36c9a34d"
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
